From: Toula Michael <keos@wanadoo.fr>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Fri, 19 Sep 2003 19:15:11 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F6B399F.8020207@wanadoo.fr>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>
	<3F6ABD35.9070104@basmevissen.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3F6ABD35.9070104@basmevissen.nl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bas Mevissen <ml@basmevissen.nl>
Cc: cpufreq@www.linux.org.uk

>
>
> powersave will only change speed when you connect or disconnect AC power.


Really ? I thougt powersave allways choose the lowest supported 
frequency (policy->min) no matter if the AC power is connect or not. A 
look at      
static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned 
int event)
{
...
}
in the file cpufreq.c (line 354) confirme that...
Do I miss something ?

Oh, and before I forget, what's the difference between policy and governor ?

Thx in advance
Mike
