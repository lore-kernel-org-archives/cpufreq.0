From: Anders Eriksson <aeriksson2@fastmail.fm>
Subject: Re: speedstep_smi & psmouse problems?
Date: Thu, 20 May 2004 21:47:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040520194800.4DE6A4137@latitude.mynet.no-ip.org>
References: <20040520184917.GM29214@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Your message of "Thu, 20 May 2004 20:49:17 +0200."
	<20040520184917.GM29214@poupinou.org> 
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
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

> It's not exactly a problem of timer issues in a driver.  Just that the
> same chip is used for the ps mouse and battery related stuff.  To be
> more precise, there is good luck that the keyboard controller (which is
> also used in order to control the mouse) is used, via a smbus, to access
> a smart battery in this case.  Then, there may be either:
> - hardware bug, or
> - bug in the firmware for this controller.
> 

Aha, I see. So it seems I have to choose to use either the battery
related stuff, or the new psmouse stuff. I seem to recall seeing some
traffic on some option to psmouse.ko which made it work in 'old' or
'absolute' mode or something. I'll check if that's more resilient to
bad interactions with battery readings...

/Anders
