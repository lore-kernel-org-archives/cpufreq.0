From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Which cpufreq driver is best for ...
Date: Thu, 04 Sep 2003 14:36:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F5731DD.8050700@basmevissen.nl>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<20030903192749.GA30360@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030903192749.GA30360@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

Dominik Brodowski wrote:

> 
> No, speedstep-ich is "superior". p4-clockmod only "throttles" the CPU, i.e.
> it scales down the frequency but not the voltage. This results in an
> approximately linear saving of energy. 

I think the confusion about clockmod workings (and hence the savings 
that can be gained from it) comes from the fact that "mod" in clockmod 
is misinterpreted as "modification" (but it stands for modulation).

> And as long as ACPI C-States "idling" or APM "hlt" instructions work, the
> CPU is "throttled"[*] if there is no work to do anyway, so the p4-clockmod
> driver doesn't save you anything. The p4-clockmod driver almost only is
> useful where ACPI or APM "idling" is borken.
> 

Maybe this (together with your extensive explanation in this thread) can 
be FAQ-ed. With a good explanation of the power saving models (clock 
modulation, clock modification&voltage scaling, cpu idling) a lot of 
questions can be answered.

Regards,

Bas.
