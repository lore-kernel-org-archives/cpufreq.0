From: mark.langsdorf@amd.com
Subject: RE: powernow-k8: Two PSTs
Date: Thu, 9 Sep 2004 14:26:00 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A843AA1A1E@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

> At work we recently got about 80 new Athlon64 PCs 
> (Fujitsu-Siemens Scenic P320, VIA K8M800, Athlon64 3200+ 
> 512KB L2, newest BIOS Rev 1.02 dated 2004-07-14) and I'm 
> experimenting with cpufreq to even further lower the heat 
> generated and power consumption, one of the main reasons why 
> we chose Athlon64s in the first place.
> 
> At first, powernow-k8 wouldn't load because the number of 
> PSTs was != 1 (actually 2) but after simply commenting out 
> the numpst check, everything worked as advertised.
>
> After subscribing to the list and looking at the archive, I 
> found Mark Langsdorf's patch and explanation for my problem.
> (http://www.linux.org.uk/mailman/private/cpufreq/2004-August/0
04191.html) 
> It's unfortunate that the archive isn't public but the patch
> worked perfectly. Is there any chance for this or a similar
> patch to be submitted for inclusion into the mainline kernel ? 

I thought by submitting it to this list I was submitting it
to the mainline kernel.  If that is not the case, I can post
it on LKML at any time.

-Mark Langsdorf
AMD, Inc.
