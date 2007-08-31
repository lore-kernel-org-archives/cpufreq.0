From: Dave Jones <davej@redhat.com>
Subject: Re: mobile pentium mmx?
Date: Fri, 31 Aug 2007 16:29:15 -0400
Message-ID: <20070831202915.GB11499@redhat.com>
References: <ebebfcb60708171319g4db97e0fy8ea93999634d688@mail.gmail.com>
	<20070822235731.GA18739@redhat.com>
	<ebebfcb60708270326kda0509ax2527d7e18ca9df10@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <ebebfcb60708270326kda0509ax2527d7e18ca9df10@mail.gmail.com>
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
To: fikin <nikolai.fiikov@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, Aug 27, 2007 at 01:26:20PM +0300, fikin wrote:
 > >Intel didn't add speedstep capability until the Mobile Pentium III.
 > 
 > right, here question is about something older.
 > 
 > this processor family apparently has freq scaling as the bios is able to do
 > it.

Probably implemented using clock modulation, which doesn't really save
any power.  Although, prior to speedsteps existance there were a few
implementations of clock frequency shifting by some vendors, but they
were vendor specific, and no documentation on how these work exists.
They were also usually not able to shift at runtime (messing with
bus speeds before speedstep arrived was extremely fragile), only selectable
in the BIOS.

 > and few years back i remember kernel 2.6 had acpi or cpufreq proc/sys
 > interface where i could play with the throttling.
 > this did the job of scaling.

throttling != scaling.

 > but nowadays i can't find anything which remotely would do the same job...

acpi throttling interface should still be present in
/proc/acpi/processor/throttling, but this has nothing to do with cpufreq
at all.

	Dave

-- 
http://www.codemonkey.org.uk
