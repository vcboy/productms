<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ProductTemplate;

/**
 * ProductTemplateSearch represents the model behind the search form about `backend\models\ProductTemplate`.
 */
class ProductTemplateSearch extends ProductTemplate
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'productclass_id', 'product_id', 'is_del'], 'integer'],
            [['unitprice'], 'number'],
            [['unit'], 'safe'],
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
        $query = ProductTemplate::find();

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

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'productclass_id' => $this->productclass_id,
            'product_id' => $this->product_id,
            'unitprice' => $this->unitprice,
            'is_del' => $this->is_del,
        ]);

        $query->andFilterWhere(['like', 'unit', $this->unit]);

        return $dataProvider;
    }
}