From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: cpufreq ondemand governor debugobjects warning
Date: Fri, 27 Dec 2013 11:01:47 +0530
Message-ID: <CAKohpom8VOHeCuhK5_4u39TEhC5Yji2VbkJK6SHTecH5hHPK5g@mail.gmail.com>
References: <52BCEA76.1020906@marvell.com>
	<52BCEEA3.4090107@marvell.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <52BCEEA3.4090107@marvell.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jane Li <jiel@marvell.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 27 December 2013 08:36, Jane Li <jiel@marvell.com> wrote:
> When gov_queue_work(), governor_enabled may be modified.  Following patch
> can fix it by adding cpufreq_governor_lock in gov_queue_work. But in this
> way, cpufreq_governor_lock also protects __gov_queue_work(). Do you think
> this is a good idea?

gov_queue_work() is called with timer_mutex on. Can you try placing this
lock around gov_cancel_work() and see if it resolves issues you have reported ?

--
viresh
