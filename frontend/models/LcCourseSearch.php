<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\LcCourse;

/**
 * LcCourseSearch represents the model behind the search form about `frontend\models\LcCourse`.
 */
class LcCourseSearch extends LcCourse
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'cid', 'item_count', 'total_time', 'class_time', 'create_date', 'update_date', 'credit', 'isdelete', 'type', 'liberty_type', 'course_tag', 'class_id', 'courseclass_id', 'isfree', 'ishot', 'isbest', 'isnew', 'weights', 'sellnum', 'corder', 'owner_type', 'owner', 'order_stu', 'share_type', 'status', 'is_show', 'study_num', 'try_see_num'], 'integer'],
            [['tag', 'code', 'name', 'name_short', 'desc_short', 'desc_long', 'img', 'video_express', 'teacher_names', 'teacher_ids', 'classtype', 'memo', 'exam_type', 'course_lecturer', 'source', 'share_ratio', 'desc_catalog'], 'safe'],
            [['price', 'rprice', 'rprice2', 'rprice3', 'order_amount'], 'number'],
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
        $query = LcCourse::find();
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
            'cid' => $this->cid,
            'item_count' => $this->item_count,
            'total_time' => $this->total_time,
            'class_time' => $this->class_time,
            'price' => $this->price,
            'rprice' => $this->rprice,
            'create_date' => $this->create_date,
            'update_date' => $this->update_date,
            'credit' => $this->credit,
            'isdelete' => $this->isdelete,
            'type' => $this->type,
            'liberty_type' => $this->liberty_type,
            'course_tag' => $this->course_tag,
            'class_id' => $this->class_id,
            'courseclass_id' => $this->courseclass_id,
            'isfree' => $this->isfree,
            'ishot' => $this->ishot,
            'isbest' => $this->isbest,
            'isnew' => $this->isnew,
            'weights' => $this->weights,
            'sellnum' => $this->sellnum,
            'corder' => $this->corder,
            'owner_type' => $this->owner_type,
            'owner' => $this->owner,
            'rprice2' => $this->rprice2,
            'rprice3' => $this->rprice3,
            'order_amount' => $this->order_amount,
            'order_stu' => $this->order_stu,
            'share_type' => $this->share_type,
            'status' => $this->status,
            'is_show' => $this->is_show,
            'study_num' => $this->study_num,
            'try_see_num' => $this->try_see_num,
        ]);

        $query->andFilterWhere(['like', 'tag', $this->tag])
            ->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'name_short', $this->name_short])
            ->andFilterWhere(['like', 'desc_short', $this->desc_short])
            ->andFilterWhere(['like', 'desc_long', $this->desc_long])
            ->andFilterWhere(['like', 'img', $this->img])
            ->andFilterWhere(['like', 'video_express', $this->video_express])
            ->andFilterWhere(['like', 'teacher_names', $this->teacher_names])
            ->andFilterWhere(['like', 'teacher_ids', $this->teacher_ids])
            ->andFilterWhere(['like', 'classtype', $this->classtype])
            ->andFilterWhere(['like', 'memo', $this->memo])
            ->andFilterWhere(['like', 'exam_type', $this->exam_type])
            ->andFilterWhere(['like', 'course_lecturer', $this->course_lecturer])
            ->andFilterWhere(['like', 'source', $this->source])
            ->andFilterWhere(['like', 'share_ratio', $this->share_ratio])
            ->andFilterWhere(['like', 'desc_catalog', $this->desc_catalog]);

        return $dataProvider;
    }
}
