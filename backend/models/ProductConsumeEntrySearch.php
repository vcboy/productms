<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ProductConsumeEntry;

/**
 * ProcutSearch represents the model behind the search form about `backend\models\ProductConsumeEntry`.
 */
class ProductConsumeEntrySearch extends ProductConsumeEntry
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id','productclass_id', 'product_id', 'product_entry_id', 'create_dt', 'is_del'], 'integer'],
            [['count','unitprice'], 'number'],
            [['create_dt_s', 'create_dt_e'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = ProductConsumeEntry::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        if($this->create_dt_s){
            $query->andFilterWhere(['>=','create_dt' ,strtotime($this->create_dt_s)]);
        }
        if($this->create_dt_e){
            //echo $this->create_dt_e+1;
            $query->andFilterWhere(['<','create_dt' ,strtotime("$this->create_dt_e + 1 day")]);
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'is_del' => $this->is_del,
            'productclass_id' => $this->productclass_id,
            'product_id' => $this->product_id,
        ]);

        return $dataProvider;
    }
}
