From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: speedstep_smi & psmouse problems?
Date: Thu, 20 May 2004 20:49:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040520184917.GM29214@poupinou.org>
References: <20040520155506.GH1976@inferi.kami.home>
	<20040520182002.7C2984137@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040520182002.7C2984137@latitude.mynet.no-ip.org>
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
To: aeriksson2@fastmail.fm
Cc: cpufreq@www.linux.org.uk

On Thu, May 20, 2004 at 08:20:01PM +0200, aeriksson2@fastmail.fm wrote:
> 
> So reading the battery status using apm has the same cpu locking/
> timer/whatever effects as the acpi method has? Is there any chance to 
> do
> the reads in a way that's not harmful to the mouse? Or perhaps the
> mouse driver is too sensitive to timer issues?

It's not exactly a problem of timer issues in a driver.  Just that the
same chip is used for the ps mouse and battery related stuff.  To be
more precise, there is good luck that the keyboard controller (which is
also used in order to control the mouse) is used, via a smbus, to access
a smart battery in this case.  Then, there may be either:
- hardware bug, or
- bug in the firmware for this controller.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
