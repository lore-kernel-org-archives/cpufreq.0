From: aeriksson2@fastmail.fm
Subject: Re: speedstep_smi & psmouse problems?
Date: Thu, 20 May 2004 20:20:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040520182002.7C2984137@latitude.mynet.no-ip.org>
References: <dongili@supereva.it>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Message from Mattia Dongili <dongili@supereva.it> of "Thu,
	20 May 2004 17:55:06 +0200." <20040520155506.GH1976@inferi.kami.home> 
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
To: cpufreq@www.linux.org.uk

> 
>doh! sorry, I've been reported many times about the jumpy mouse and 
it
>was always related to acpi+cpufreqd (and the acpi_workaround option 
is
>acpi only).

>Battery reads cannot be disabled with apm as /proc/apm reports all
> power management informations together.
 

So reading the battery status using apm has the same cpu locking/
timer/whatever effects as the acpi method has? Is there any chance to 
do
the reads in a way that's not harmful to the mouse? Or perhaps the
mouse driver is too sensitive to timer issues?

/Anders
