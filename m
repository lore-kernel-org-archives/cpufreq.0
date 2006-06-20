From: Ben Kevan <ben.kevan@gmail.com>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable	Enchanced
	SpeedStep
Date: Tue, 20 Jun 2006 14:09:14 -0700
Message-ID: <200606201409.14939.ben.kevan@gmail.com>
References: <200606191610.40597.ben.kevan@gmail.com>
	<200606201332.01928.ben.kevan@gmail.com>
	<44985C6D.9010700@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44985C6D.9010700@goop.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>, linux@brodo.de

On Tuesday 20 June 2006 13:37, Jeremy Fitzhardinge wrote:
> Ben Kevan wrote:
> > speedstep-centrino: P1 has larger frequency (65535) than P0 (600),
> > skipping
>
> Do you know this machine supports multiple power states for the CPU?
> Does it work under Windows?  Because my reading of all this is that the
> BIOS claims it only runs at 600MHz, and is doing everything in its power
> to enforce that.
>
>     J

Hi J, 

Yes, this does work in Windows but if I remember correctly you have to use the 
Toshiba Power Utilities to Increase it from 600Mhz up to 1.60Ghz

I have checked the BIOS and have found nothing that allows me to change CPU 
power states or anything with the CPU / SpeedStep etc. 

But the strange thing is when I took out my Linux HDD and slapped in a windows 
HDD, it came up by default at 600 (598)Mhz and had to change the power 
settings to support 1.60Ghz. 

Let me check BIOS again, and double check that there is nothing in there for 
power / cpu settings. ( again, I am running the most up to date BIOS for my 
machine). 

Ben
