From: Carl Thompson <cet@carlthompson.net>
Subject: Re: CPUSpeed 1.1 released (finally)
Date: Sun,  9 Nov 2003 12:00:04 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1068408004.b7977ea6c60f1@carlthompson.net>
References: <1068264857.2c5ff476f0b29@carlthompson.net>
	<1068370287.7434.0.camel@laptop.fenrus.com>
	<1068371332.7434.3.camel@laptop.fenrus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <1068371332.7434.3.camel@laptop.fenrus.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: arjanv@redhat.com
Cc: NERvOus <nervous@nervous.it>, Gerald Teschl <Gerald.Teschl@univie.ac.at>, Christian Zoz <zoz@suse.de>, Enrico Tassi <tassi@cs.unibo.it>, CPUFreq Mailing List <cpufreq@www.linux.org.uk>

Quoting Arjan van de Ven <arjanv@redhat.com>:

> > ...

> > However one minor nitpick: It's not allowed to call fopen() from a
> > signal handler....... I'll try to work up a patch for this and send it

It _is_ allowed to call fopen() from a signal handler...  Perhaps what you
mean is that fopen() is not a reentrant function and non-reentrant
functions are usually not used in signal handlers?  This is because you
don't want non-reentrant functions in the main program and in the signal
handlers to clobber each other.  However, in this case the main program is
a tight loop that does nothing except raise the ALRM signal so the use of
non-reentrant functions in the signal handlers will not interfere with
anything.  The only issue is making sure that the signal handlers cannot
interrupt each other causing the same problem, and that is why I block all
of the signals in all of the signal handlers.

> patch attached; it also converts usleep to nanosleep which I've been
> told is the much better API for this sort of thing anyway.

Well, the problem with usleep() is that it uses SIGALRM in some
implementations... However, the glibc implementation seems to just to be a
wrapper around nanosleep() and does not cause issues so I chose usleep()
because the interface is simpler.  However, I will switch it to nanosleep()
because there may be some Linux installations that do not use glibc but
some other C library that has an issue.

> It turns out that the code never really actually set an alarm, but
> really just raise()'d the signal instead of doing a function call....

Your patch would allow alarm_handler() (called as a regular function) to be
interrupted by the  hup_handler() handler.  This would actually have the
opposite affect as intended because both functions use non-reentrant
functions.

So the short answer is that the logic of the program will stay the same
because it is not broken but I will switch to using nanosleep().

Thanks,
Carl Thompson
