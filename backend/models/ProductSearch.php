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
            [['id',  'book_comment','is_customer',  'send_status',  'inspect_status', 'is_del'], 'integer'],
            [['booker_user', 'sender_user', 'send_comment', 'inspector_user', 'inspect_comment','send_date', 'inspect_date','arrive_date',  'book_date','customer',  'dt_s','dt_e'], 'safe'],
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
            'book_comment' => $this->book_comment,
            'is_customer' => $this->is_customer,
            'total_price' => $this->total_price,
            'send_status' => $this->send_status,
            'inspect_status' => $this->inspect_status,
            'is_del' => $this->is_del,
        ]);

        if($this->book_date){
            $query->andFilterWhere(['book_date' => strtotime($this->book_date)]);
        }

        if($this->arrive_date){
            $query->andFilterWhere(['arrive_date' => strtotime($this->arrive_date)]);
        }

        if($this->send_date){
            $query->andFilterWhere(['send_date' => strtotime($this->send_date)]);
        }

        if($this->inspect_date){
            $query->andFilterWhere(['inspect_date' => strtotime($this->inspect_date)]);
        }

        if($this->dt_s){
            $query->andFilterWhere(['>=','inspect_date' ,strtotime($this->dt_s)]);
        }
        
        if($this->dt_e){
            $query->andFilterWhere(['<','inspect_date' ,strtotime("$this->dt_e + 1 day")]);
        }

        $query->andFilterWhere(['like', 'booker_user', $this->booker_user])
            ->andFilterWhere(['like', 'sender_user', $this->sender_user])
            ->andFilterWhere(['like', 'send_comment', $this->send_comment])
            ->andFilterWhere(['like', 'inspector_user', $this->inspector_user])
            ->andFilterWhere(['like', 'inspect_comment', $this->inspect_comment])
            ->andFilterWhere(['like', 'customer', $this->customer]);

        return $dataProvider;
    }
}
