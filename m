From: Mattia Dongili <dongili@supereva.it>
Subject: Re: speedstep_smi & psmouse problems?
Date: Thu, 20 May 2004 17:55:06 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040520155506.GH1976@inferi.kami.home>
References: <20040520152703.GG1976@inferi.kami.home>
	<20040520154025.CAFE24137@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040520154025.CAFE24137@latitude.mynet.no-ip.org>
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

On Thu, May 20, 2004 at 05:40:25PM +0200, aeriksson2@fastmail.fm wrote:
> 
> > try setting 
> > acpi_workaround=1
> > 
> > reading /proc/acpi/battery/*/info can be very slow (they are also
> > performed with disabled interrupts) and thus your mouse
> > is jumpy. The above option avoids such reads.
> > 
> 
> I use apm, but I tried it anyway, and it makes no difference. (if I
> switch to acpi, the fans never gets started, so the machine
> emergency-stops in the middle of heavy compiles :-( )

doh! sorry, I've been reported many times about the jumpy mouse and it
was always related to acpi+cpufreqd (and the acpi_workaround option is
acpi only).

Battery reads cannot be disabled with apm as /proc/apm reports all power
management informations together.

-- 
mattia
:wq!
