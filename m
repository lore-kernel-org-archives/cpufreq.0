From: aeriksson2@fastmail.fm
Subject: Re: speedstep_smi & psmouse problems?
Date: Mon, 24 May 2004 12:22:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040524102240.EF92C3F04@latitude.mynet.no-ip.org>
References: <aeriksson2@fastmail.fm>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Message from Anders Eriksson <aeriksson2@fastmail.fm> of "Thu,
	20 May 2004 21:47:59 +0200."
	<20040520194800.4DE6A4137@latitude.mynet.no-ip.org> 
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



> Aha, I see. So it seems I have to choose to use either the battery
> related stuff, or the new psmouse stuff. I seem to recall seeing some
> traffic on some option to psmouse.ko which made it work in 'old' or
> 'absolute' mode or something. I'll check if that's more resilient to
> bad interactions with battery readings...
> 

Tried that (using proto=exps instead of proto=imps), but no success.
Do you know if the psmouse driver can be tweaked to handle this (hw
bug, I assume) more gracefully? Given the way the mouse jumps on
the screen, It seems a low-pass filter could do some good...

/Anders
