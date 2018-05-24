<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Purchase;

/**
 * PurchaseSearch represents the model behind the search form about `backend\models\Purchase`.
 */
class PurchaseSearch extends Purchase
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'foodclass_id', 'food_id', 'param_id', 'book_count', 'depot_count', 'sycount', 'status', 'is_del'], 'integer'],
            [['price'], 'number'],
            [['unit', 'brand', 'supplier', 'comment','pur_date','depot_date', 'pur_user', 'depot_user'], 'safe'],
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
        $query = Purchase::find();

        $query->where(['is_del'=>0]);

        $query->orderBy('id desc');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'foodclass_id' => $this->foodclass_id,
            'food_id' => $this->food_id,
            'param_id' => $this->param_id,
            'book_count' => $this->book_count,
            'price' => $this->price,
            'pur_user' => $this->pur_user,            
            'depot_user' => $this->depot_user,
            'depot_count' => $this->depot_count,
            'depot_date' => $this->depot_date,
            'sycount' => $this->sycount,
            'status' => $this->status,
            'is_del' => $this->is_del,
        ]);

        if($this->pur_date){
            $query->andFilterWhere(['pur_date' => strtotime($this->pur_date)]);
        }

        $query->andFilterWhere(['like', 'unit', $this->unit])
            ->andFilterWhere(['like', 'brand', $this->brand])
            ->andFilterWhere(['like', 'supplier', $this->supplier])
            ->andFilterWhere(['like', 'comment', $this->comment]);

        return $dataProvider;
    }
}
