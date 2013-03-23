From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: More cpufreq breakage
Date: Sat, 23 Mar 2013 20:46:00 +0530
Message-ID: <CAKohpok-75YSAwdni5O07PtmEZbSKF9YrJjpHtG+r0T-aVn6ww@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
	<20130323134541.GA10811@pd.tnic>
	<5152799.d8sLDQMJWT@vostro.rjw.lan>
	<CAKohpomTBEu1ByjnSw1mbyBhXKTrj=Qte7fBuyaKp+TcOb8d_w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpomTBEu1ByjnSw1mbyBhXKTrj=Qte7fBuyaKp+TcOb8d_w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 1i5t5.duncan@cox.net, Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On 23 March 2013 20:04, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> I think otherwise, Its the cpu online path but this didn't happened for
> first boot (probably).

I tried on my 4 cpu laptop and my bad, couldn't reproduce the issue
reported by both Borislav and Duncan :(

Hibernation logs (Borislav's bug):
https://pastebin.linaro.org/2019/

cpufreq-info after hibernation (same happens with suspend)  (Duncan's bug):
https://pastebin.linaro.org/2020/

The main difference between our systems is number of cpu groups that share
clock line. On setup of both Duncan and Borislav, they had total of 8 cpus and
four groups 0-1, 2-3, 4-5, 6-7. And thus have four policy structures. And i have
only one group 0-1-2-3 and thus only one policy struct.

For Duncan: The first policy structure (that has boot cpu) never gets corrupted
and probably that's why i am not able to reproduce it again.

@Borislav: BTW, can you try reproducing your issue again? If that is
reproducible?

I am asking for this because your logs looked confusing to me.

Mar 20 10:14:40 pd vmunix: [34173.893409]  [<ffffffff8103b33f>]
warn_slowpath_common+0x7f/0xc0
Mar 20 10:14:40 pd vmunix: [34173.893417]  [<ffffffff8103b39a>]
warn_slowpath_null+0x1a/0x20
Mar 20 10:14:40 pd vmunix: [34173.893424]  [<ffffffff8159654c>]
mutex_lock_nested+0x39c/0x3b0
Mar 20 10:14:40 pd vmunix: [34173.893432]  [<ffffffff8144b94d>] ?
cpufreq_governor_dbs+0x3bd/0x560
Mar 20 10:14:40 pd vmunix: [34173.893441]  [<ffffffff8106bded>] ?
__blocking_notifier_call_chain+0x7d/0xd0
Mar 20 10:14:40 pd vmunix: [34173.893449]  [<ffffffff8144b94d>] ?
cpufreq_governor_dbs+0x3bd/0x560
Mar 20 10:14:40 pd vmunix: [34173.893457]  [<ffffffff81074ce1>] ?
get_parent_ip+0x11/0x50
Mar 20 10:14:40 pd vmunix: [34173.893464]  [<ffffffff81074d99>] ?
sub_preempt_count+0x79/0xd0
Mar 20 10:14:40 pd vmunix: [34173.893472]  [<ffffffff8144b94d>]
cpufreq_governor_dbs+0x3bd/0x560

I don't see (logically) how sub_preempt_count() can be called from
cpufreq_governor_dbs()? As it is mostly called from kernel/sched/ part only.

So maybe two logs are mixed here and crash got due to
sub_preempt_count()->get_parent_ip() and not cpufreq. :)

If you still get it, try disabling cpufreq completely and see if it is
gone or not.

Thanks in Advance.

--
viresh
