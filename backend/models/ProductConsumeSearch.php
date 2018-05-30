<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ProductConsume;

/**
 * ProductConsumeSearch represents the model behind the search form about `backend\models\ProductConsume`.
 */
class ProductConsumeSearch extends ProductConsume
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'productclass_id', 'product_id', 'count', 'consume_type', 'status', 'create_dt'], 'integer'],
            [['unitprice', 'price'], 'number'],
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
        $query = ProductConsume::find()->with(['productclass','product']);
        $query->orderBy('status asc,id desc');

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
            'productclass_id' => $this->productclass_id,
            'product_id' => $this->product_id,
            'unitprice' => $this->unitprice,
            'price' => $this->price,
            'count' => $this->count,
            'consume_type' => $this->consume_type,
            'status' => $this->status,
            'create_dt' => $this->create_dt,
        ]);

        return $dataProvider;
    }
}
