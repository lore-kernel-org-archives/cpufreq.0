From: Dave Jones <davej@redhat.com>
Subject: Re: speedfreq: epia + longhaul + speedfreq + copying large files =
	freeze
Date: Wed, 22 Dec 2004 15:31:36 -0500
Message-ID: <20041222203136.GB21861@redhat.com>
References: <41C83AA7.6010204@gmx.net> <1103742159.16413.24.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1103742159.16413.24.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Sebastian <sebastian_ml@gmx.net>, cpufreq list <cpufreq@www.linux.org.uk>

On Wed, Dec 22, 2004 at 11:02:39AM -0800, Jeremy Fitzhardinge wrote:
 > On Tue, 2004-12-21 at 16:00 +0100, Sebastian wrote:
 > > Dear Jeremy,
 > > 
 > > thanks for your tool! I like it best of all cpufreq daemons,
 > 
 > Thanks!
 > 
 > This problem sounds like a bug in the longhaul driver though, which I
 > don't really know anything about.  (The system should never crash,
 > regardless of what speedfreqd does.)  
 > 
 > I've cc:d the cpufreq list to see if someone there can help.  Dave?

Yeah, longhaul is badly broken right now, and tbh, I've no idea
what on earth is wrong. Speed transitions happen, and work correctly.
Then a few minutes later, system locks up.

I've been trying all sorts of things, from disabling PCI mastering,
disabling CPU caches, etc, but nothing seems to help. I'm truly puzzled.

		Dave
