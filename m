From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Which cpufreq driver is best for ...
Date: Wed, 03 Sep 2003 13:37:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F55D261.6010407@basmevissen.nl>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
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
To: Norbert Preining <preining@logic.at>
Cc: cpufreq@www.linux.org.uk

Norbert Preining wrote:

> Hi!
> 
> Which cpufreq driver is best for 
> 	Mobile Intel(R) Pentium(R) 4 - M CPU 2.20GHz
> I can use the
> 	p4-clockmod
> and the
> 	speedstep-ich
> With the p4-clockmod I can adapt the freq between 274MHz and 2.2GHz,
> while with speedstep-ich I can only go between 1.2GHz and 2.2GHz. So I
> guess p4-clockmod is superior for my chip/cpu.
> 

It depends on what you want. If you want to get battery life to the max 
(and power consumption/heat production as low as possible), you need 
p4-clockmod.

I just use speedstep-ich on mu P4@2.0G (Dell Inspiron 8500) only to 
switch between 1.2GHz and 2.0GHz. My main use is lowering the 
temperature and rising the battery life when I'm working with my labtop 
litterly as lab-top (and no longer getting heated up too much by the 
notebook :-) ).

So I'm happy with the "heat control" only, you might want to have more 
than that.

> In the same line - are there any new governors with `intelligent'
> scaling techniques. ATM I am using cpudyn, which switches between min
> and max frequences.
> 

If you use speedstep-ich, you might only want to switch speeds depending 
on AC or battery power, eventually with manual override. That should be 
possible with e.g. acpid and some scripts, while using cpufreq in 
userspace governer mode.

If you really want the best battery life, you can use/write a governor 
that depends on e.g. load. (I've seen something about that somewhere.)

Regards,

Bas.
