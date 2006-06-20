From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable	Enchanced
 SpeedStep
Date: Tue, 20 Jun 2006 11:07:07 -0700
Message-ID: <4498394B.3080909@goop.org>
References: <200606191610.40597.ben.kevan@gmail.com>
	<20060620094357.GB3700@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060620094357.GB3700@poupinou.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk, Ben Kevan <ben.kevan@gmail.com>, linux@brodo.de

Bruno Ducrot wrote:
> That's strange.  Even if there is no processor object declared onto ACPI
> tables it should work with CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE set since
> it's a bania.
>   

This message specifically means that the CPU isn't allowing EST to be 
enabled, even though the CPU has the capability.  I think the BIOS can 
lock this down, like VT on later processors.  Though I can't imagine 
why, unless the machine is being sold as a cheaper/slower system than 
the CPU they put in it...

What does the SMM patch do?

    J
