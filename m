From: Jorgen <jorgen@greven.dk>
Subject: Re: Enhanced PowerSaver driver
Date: Wed, 31 Jan 2007 11:33:10 +0000 (UTC)
Message-ID: <loom.20070131T122840-94@post.gmane.org>
References: <45BC9E94.6080701@interia.pl> <20070128142543.GA1676@redhat.com>
	<45BCD520.4080308@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: cpufreq@lists.linux.org.uk

> > Are you going to sift through their C7 driver and send diffs, or shall
> > I add to my todo ?
> > 
> > thanks,
> > 
> > 		Dave
> 
> Well, this driver is based on 2.6.16 Longhaul. I have a couple of 
> small patches for C3 which I would like to send first. I would like 
> to help, but I don't have access to any motherboard with C7 CPU. 
> I can't test it. I just think that there is no need to add my version 
> to kernel when there is official VIA driver available.
> 
> Regards
> Rafał
> 
> ----------------------------------------------------------------------
> Zalety czapki niewidki. Zobacz >> http://link.interia.pl/f19e3
> 

I have a board (IB798) with a Via Eden CPU (a C7 deviate). On kernel 2.6.16.38 I
tried to compile and load Via's longhaul driver. When I started cpufreq, the O/S
crashed.

If e.g. Rafał create som patches for the original longhaul driver, from ideas
based on Via's code, I will install them, test and give feedback.

Brgds Jorgen
