<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Product;

/**
 * ProductSearch represents the model behind the search form about `backend\models\Product`.
 */
class ProductSearch extends Product
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'book_date', 'book_comment', 'arrive_date', 'is_customer', 'send_date', 'send_status', 'inspect_date', 'inspect_status', 'is_del'], 'integer'],
            [['booker_user', 'sender_user', 'send_comment', 'inspector_user', 'inspect_comment', 'customer'], 'safe'],
            [['total_price'], 'number'],
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
        $query = Product::find();

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
            'book_date' => $this->book_date,
            'book_comment' => $this->book_comment,
            'arrive_date' => $this->arrive_date,
            'is_customer' => $this->is_customer,
            'total_price' => $this->total_price,
            'send_date' => $this->send_date,
            'send_status' => $this->send_status,
            'inspect_date' => $this->inspect_date,
            'inspect_status' => $this->inspect_status,
            'is_del' => $this->is_del,
        ]);

        $query->andFilterWhere(['like', 'booker_user', $this->booker_user])
            ->andFilterWhere(['like', 'sender_user', $this->sender_user])
            ->andFilterWhere(['like', 'send_comment', $this->send_comment])
            ->andFilterWhere(['like', 'inspector_user', $this->inspector_user])
            ->andFilterWhere(['like', 'inspect_comment', $this->inspect_comment])
            ->andFilterWhere(['like', 'customer', $this->customer]);

        return $dataProvider;
    }
}
