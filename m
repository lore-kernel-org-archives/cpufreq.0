From: Mattia Dongili <dongili@supereva.it>
Subject: Re: 2.4.23 + mobile athlon
Date: Thu, 18 Dec 2003 10:11:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031218091152.GA939@inferi.kami.home>
References: <3FE061A5.2090206@aon.at>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3FE061A5.2090206@aon.at>
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Wed, Dec 17, 2003 at 03:01:09PM +0100, Bernhard Bauch wrote:
> hi!
> i just patched kernel-2.4.23 with cpufreq and it worked :)
> ########################
> /var/log/dmes:
> ....
> powernow: AMD K7 CPU detected.
[...]
> everything seems to be OK, but:
> ################################
> beatle:/proc/sys/cpu/0# more speed*
> ::::::::::::::
> speed
> ::::::::::::::
> 0
> ::::::::::::::
> speed-max
> ::::::::::::::
> 0
> ::::::::::::::
> speed-min
> ::::::::::::::
> 0
> #####################
> 
> mhh why are all of these parameters zero ??

these are parameters for the userspace governor, try echo
"0%0%100%userspace" > /proc/cpufreq

and play with them

> -----------------------------------------------------------------------
> /proc/acpi/processor/CPU1/info:
> processor id:            0
> acpi id:                 1
> bus mastering control:   no
> power management:        yes
> throttling control:      no
> performance management:  no
> limit interface:         no
> 
> /proc/acpi/processor/CPU1/throttling
> <not supported>
> 
> whats going on here ???
> why is throtteling not supported ??

acpi throttling is not cpufreq :) (I remember detailed discussions on
the topic either on this list or the acpi-devel one)

> -----------------------
> other question:
> is there a way to run cpufreqd with libc 2.2.5-11.5 (debian woody - 
> stable) ??

you could download the debian source package and make a woody deb from
it. You actually need a couple of adjustments:
- remove the debconf version dependency from the debian/control file:
  Build-Depends: debhelper (>> 4.0.0), debconf (>= 1.2.9)
                                               ^^^^^^^^^^
- modify following the line of debian/postinst from
  unset CPUFREQD_PM
  to
  [ -z ${CPUFREQD_PM} ] || unset CPUFREQD_PM

and build the binary deb as usual (see release notes on sourceforge).

write me off list if you need help

ciao
-- 
mattia
:wq!
