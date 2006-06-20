From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable	Enchanced
 SpeedStep
Date: Tue, 20 Jun 2006 13:37:01 -0700
Message-ID: <44985C6D.9010700@goop.org>
References: <200606191610.40597.ben.kevan@gmail.com>	<20060620094357.GB3700@poupinou.org>
	<4498394B.3080909@goop.org>
	<200606201332.01928.ben.kevan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200606201332.01928.ben.kevan@gmail.com>
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
To: Ben Kevan <ben.kevan@gmail.com>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>, linux@brodo.de

Ben Kevan wrote:
> speedstep-centrino: P1 has larger frequency (65535) than P0 (600), skipping
>   
Do you know this machine supports multiple power states for the CPU?  
Does it work under Windows?  Because my reading of all this is that the 
BIOS claims it only runs at 600MHz, and is doing everything in its power 
to enforce that.

    J
