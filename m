From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Fri, 19 Sep 2003 10:36:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030919083610.GB732@inferi.kami.home>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>
	<3F6ABD35.9070104@basmevissen.nl>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F6ABD35.9070104@basmevissen.nl>
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

On Fri, Sep 19, 2003 at 10:24:21AM +0200, Bas Mevissen wrote:
> Jan Rychter wrote:
> >
> >I've tried echo "0%100%powersave" > /proc/cpufreq 
> >  and 
> > echo "0%50%powersave" > /proc/cpufreq
> >
> >and much to my surprise, even though /proc/cpufreq echoes my changes, I
> >can see no resulting changes in power consumption as reported by ACPI
> >battery proc entry.
> >
> 
> The line should read echo "0%0%100%userspace" >/proc/cpufreq to get 
[...]
> powersave will only change speed when you connect or disconnect AC power.

AFAIK powersave statically sets the cpu at the minimum allowed (0% in
OP's case), while performance sets to the maximum allowed.

In this case there aren't changes because the speed/voltage is 0% of
full speed both in 

0%100%powersave

and 

0%50%powersave

correct?

try the same with performance and see if there is some changes in
/proc/cpuinfo, /proc/acpi/battery/.../state

bye
-- 
mattia
:wq!
