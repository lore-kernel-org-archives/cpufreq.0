From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Cpufreq question ...
Date: Mon, 9 Feb 2004 16:42:01 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209154201.GC13262@poupinou.org>
References: <20040205020533.565d7fe6.neurowork@free.fr>
	<20040208154049.GA19441@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040208154049.GA19441@dominikbrodowski.de>
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
To: Cyril Wattebled <neurowork@free.fr>, cpufreq@www.linux.org.uk

On Sun, Feb 08, 2004 at 04:40:49PM +0100, Dominik Brodowski wrote:
> On Thu, Feb 05, 2004 at 02:05:33AM +0100, Cyril Wattebled wrote:
> > Hi there,
> > 
> > I have a centrino 1.7ghz on my sony z1rsp laptop.
> > On linux, cpufreq works like a charm especially with speedfreqd which throttles
> > the cpu from 600mhz to 1.7ghz dynamicly.
> > I have however a question that's in my mind for a long time ...
> > On M$ windows, the os is able to throttle the cpu down to 200 mhz which is enough
> > most of the time, and keep the laptop from been too hot.
> > So I'm wondering why cpufreq detects 600 mhz for a cpu that is able to go below
> > 600mhz. By the way, I'm using enhanced speedstep module. I have tried various other
> > modules and only p4-clockmod allowed me to throttle the cpu down to 200 mhz but I
> > heard that p4-clockmod isn't as effective as enhanced speedstep for the power management
> > since enhanced speedstep changes voltage values.
> > So is there a way to tweak cpufreq to allow the cpu to be throttled at a lower speed ?
> 
> Throttling doesn't save you much or even nothing, and what M$ windows does
> is _wrong_. If the system is idle, the CPU is put into ACPI idle states, and
> they are as effective as throttling is.
> 
> 

What is worst is when there exist stupid OEM that think they are smarter
than OS writter.  My current laptop (it's not a Toshiba) *throttle* the
processor when I switch from AC to battery even if ACPI is enabled.

And of course, it can not be disabled on boot menu, etc.  Grrr.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
