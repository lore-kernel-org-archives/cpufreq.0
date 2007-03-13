From: Dave Jones <davej@redhat.com>
Subject: Re: Mobile Celeron
Date: Tue, 13 Mar 2007 15:01:21 -0400
Message-ID: <20070313190121.GD27471@redhat.com>
References: <50df9eb80703121320k182b0aa9x8fd7c6c7969384d7@mail.gmail.com>
	<20070313013801.GA5364@tatooine.rebelbase.local>
	<50df9eb80703131114wcff0a56g1d93499531eee9a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <50df9eb80703131114wcff0a56g1d93499531eee9a@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Meyer <ranfyy@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, Mar 13, 2007 at 07:14:16PM +0100, Ralf Meyer wrote:
 > On 3/13/07, markus reichelt <ml@mareichelt.de> wrote:
 > > * Ralf Meyer <ranfyy@gmail.com> wrote:
 > >
 > > > is a Mobile Celeron supposed to be able to do CPU frequency
 > > > scaling?
 > >
 > > run cpuid and check for something like Enhanced Intel SpeedStep
 > > Technology
 > >
 > > cpuid @ http://www.etallen.com/cpuid.html
 > 
 > Thanks. I didn't know this tool.
 > 
 > $ cpuid | grep -i speed     # gave me:
 > ---
 >       Enhanced Intel SpeedStep Technology    = false
 > ---
 > 
 > Its man page led me to the Datasheet (29851706.pdf). In the Power
 > Management chapter there is no mention of speedstep or enhanced
 > speedstep but something called Quickstart. I never heard about this
 > before.
 > 
 > Does Quickstart work all by itself?

iirc, quickstart is just a c-state, that (providing your BIOS has
an ACPI implementation that works) should 'just work'.

 > My original question should have been clearer in that I wanted to know
 > if the hardware is capable of frequency scaling of some sort.

I don't recall any celerons having frequency scaling.

	Dave

-- 
http://www.codemonkey.org.uk
