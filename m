From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Longhaul - infrastructure(?) proposal
Date: Thu, 29 Jun 2006 17:05:19 +0200
Message-ID: <44A3EC2F.7040909@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-9"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

Hello!

In case that flushing and disabling caches will not work.
It is possible that I do above in wrong way.
Would this code below be acceptable as infrastructure?
Is this infrastructure or maybe hack?
This is draft/proposal.
Can I continue in this way or I shouldn't?

Rafa=B3

---

/*
 * Longhaul "infrastructure" for bus master DMA
 */

struct longhaul_work {
	struct list_head entry;
	struct work_struct work;
	struct longhaul_data *data;
	void (*device_func) (void *data);
	void *device_data;
};

struct longhaul_data {
	struct workqueue_struct *wq;
	spinlock_t lock;
	struct list_head work_unused;
	struct list_head work_inuse;
	struct list_head work_used;
};

/* Access control for PCI bus */
static struct rw_semaphore longhaul_sem;

struct longhaul_data *longhaul_bmdma_register(char *name)
{
	struct longhaul_data *longdata;
	struct longhaul_work *longwork;
	struct workqueue_struct *workqueue;

	longdata =3D kmalloc(sizeof(struct longhaul_data), GFP_KERNEL);
	if (longdata =3D=3D NULL)
		return NULL;
	spin_lock_init(&longdata->lock);
	INIT_LIST_HEAD(&longdata->work_unused);
	INIT_LIST_HEAD(&longdata->work_inuse);
	INIT_LIST_HEAD(&longdata->work_used);

	longwork =3D kmalloc(sizeof(struct longhaul_work), GFP_KERNEL);
	if (longwork =3D=3D NULL) {
		goto free_longdata;
	}
	INIT_WORK(&longwork->work, &longhaul_bmdma_work, NULL);
	list_add(longwork, &longdata->work_unused);
	longwork->data =3D longdata;

	workqueue =3D create_singlethread_workqueue(name);
	if (workqueue =3D=3D NULL) {
		printk(KERN_ERR PFX "Can't create workqueue \"%s\".\n", name);
		goto free_longwork;
	}
	longdata->wq =3D workqueue;

	return longdata;

free_longwork:
	kfree(longwork);
free_longdata:
	kfree(longdata);
	return NULL;
}
EXPORT_SYMBOL(longhaul_bmdma_register);


void longhaul_bmdma_unregister(struct longhaul_data *longdata)
{
}
EXPORT_SYMBOL(longhaul_bmdma_unregister);


static void longhaul_bmdma_work(void *data)
{
	struct longhaul_work *longwork =3D data;
	struct longhaul_data *longdata =3D longwork->data;
	unsigned long flags;

	down_read(&longhaul_sem);

	longdata->device_func(longdata->device_data);

	spin_lock_irqsave(&longdata->lock, flags);
	list_move(longwork, &longdata->work_used);
	spin_unlock_irqrestore(&longdata->lock, flags);
}

int longhaul_bmdma_begin(struct longhaul_data *longdata,
			void (*device_func) (void *data),
			void *device_data);
{
	struct longhaul_work *longwork;
	unsigned long flags;

	spin_lock_irqsave(&longdata->lock, flags);

	if ( list_empty(&longdata->work_unused) ) {
		longwork =3D kmalloc(sizeof(struct longhaul_work), GFP_ATOMIC);
		if (longwork =3D=3D NULL) {
			spin_unlock_irqrestore(&longdata->lock, flags);
			return -ENOMEM;
		}
		INIT_WORK(&longwork->work, &longhaul_bmdma_work, NULL);
		longwork->data =3D longdata;
		list_add(longwork, &longdata->work_inuse);
	} else {
		longwork =3D longdata->work_unused->next;
		list_move(longwork, &longdata->work_inuse);
	}

	spin_unlock_irqrestore(&longdata->lock, flags);

	longwork->device_func =3D device_func;
	longwork->device_data =3D device_data;
	PREPARE_WORK(longwork, &longhaul_bmdma_work, (void*)longwork);
	queue_work(longdata->wq, longwork);

	return 0;
}
EXPORT_SYMBOL(longhaul_bmdma_begin);


void longhaul_bmdma_end(struct longhaul_data *longdata)
{
	struct list_head pos;
	unsigned long flags;

	spin_lock_irqsave(&longdata->lock, flags);

	if ( !list_empty(&longdata->work_used) ) {
		list_for_each(pos, &longdata->work_used) {
			list_move(longwork, &longdata->work_unused);
		}
	}

	spin_unlock_irqrestore(&longdata->lock, flags);

	up_read(&longhaul_sem);
}
EXPORT_SYMBOL(longhaul_bmdma_end);


----------------------------------------------------------------------
PS. Fajny portal... >>> http://link.interia.pl/f196a
