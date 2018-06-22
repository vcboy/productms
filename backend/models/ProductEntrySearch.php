<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ProductEntry;

/**
 * ProductEntrySearch represents the model behind the search form about `backend\models\ProductEntry`.
 */
class ProductEntrySearch extends ProductEntry
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'pid', 'productclass_id', 'product_id','status'], 'integer'],
            [[ 'book_count', 'send_count', 'depot_count', 'sycount'], 'number'],
            [['unitprice', 'price'], 'number'],
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
        $query = ProductEntry::find();

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
            'pid' => $this->pid,
            'productclass_id' => $this->productclass_id,
            'product_id' => $this->product_id,
            'unitprice' => $this->unitprice,
            'price' => $this->price,
            'book_count' => $this->book_count,
            'send_count' => $this->send_count,
            'depot_count' => $this->depot_count,
            'sycount' => $this->sycount,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'unit', $this->unit]);

        return $dataProvider;
    }
}
