From: Dave Jones <davej@redhat.com>
Subject: Re: Shell script to select the right cpufreq module?
Date: Thu, 1 Apr 2004 13:48:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040401124810.GA32536@redhat.com>
References: <4069CA25.2080806@free.fr>
	<20040330203109.GA7141@dominikbrodowski.de>
	<20040331073455.q797owk8kwogcccw@carlthompson.net>
	<20040331154400.GA32308@dominikbrodowski.de>
	<20040331155938.GF25834@redhat.com>
	<20040331205256.y2gjkw0404swwk84@carlthompson.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040331205256.y2gjkw0404swwk84@carlthompson.net>
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
To: Carl Thompson <cet@carlthompson.net>
Cc: cpufreq mailing list <cpufreq@www.linux.org.uk>

On Wed, Mar 31, 2004 at 08:52:56PM -0800, Carl Thompson wrote:

 > > > > Fedora Core 2 does not seem to even include the
 > > > > speedstep-ich driver.
 > > > OOOOPS. Dave?
 > >
 > >A grep shows..
 > >CONFIG_X86_SPEEDSTEP_ICH=y
 > >
 > Well, if the module name is supposed to be "speedstep-ich.ko" then I'm
 > not seeing it installed anywhere...

=y means non-modular. It's compiled in.

		Dave
