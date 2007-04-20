From: Dave Jones <davej@redhat.com>
Subject: Re: Voltage tweaking in powernow_k8
Date: Fri, 20 Apr 2007 17:57:57 -0400
Message-ID: <20070420215757.GJ20566@redhat.com>
References: <20070415171810.GA3096@thing.nowhere>
	<1449F58C868D8D4E9C72945771150BDF02076D07@SAUSEXMB1.amd.com>
	<46239583.67d3ffa6.271c.2ed5@mx.google.com>
	<1449F58C868D8D4E9C72945771150BDF02076D28@SAUSEXMB1.amd.com>
	<20070420185533.GE13939@redhat.com>
	<46292aa8.20f70c71.2add.ffffa105@mx.google.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <46292aa8.20f70c71.2add.ffffa105@mx.google.com>
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
To: Roberto Gordo Saez <roberto.gordo@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Fri, Apr 20, 2007 at 11:03:33PM +0200, Roberto Gordo Saez wrote:
 > On Fri, Apr 20, 2007 at 02:55:33PM -0400, Dave Jones wrote:
 > > I'm not enthusiastic about merging this code at all.
 > > The big problem I see is that a lot of the reasons people want
 > > to do this is "The bios say xyz, but the datasheet says it can do xyz+-1"
 > 
 > Yes, I must admit so. It seems that many people just want to do heavy
 > overclock. And it can be difficult to detect a broken BIOS... though
 > I've discovered an interesting method: when the customer support tells
 > you to install crystalcpuid (a Windows utility) and then they reply that
 > Linux is not a supported OS, then there are high chance that their BIOS
 > is broken :-)
 > 
 > There seems to be some comments on certain laptops giving overpower to
 > Turions, but I can't confirm how many of them are real BIOS bugs. I will
 > probably continue with this as an unofficial patch. Thank you anyway
 > for looking into this.

What I wouldn't object to however, if we do find tables that are *clearly*
broken, and we can't convince the manufacturer to do a fixed BIOS release,
adding override tables in the driver matching on DMI of the broken
systems would be fine by me.

But as you say, knowing whether the BIOS is broken, or if the manufacturer
had good reason to configure the tables that way is very hard to determine.

	Dave

-- 
http://www.codemonkey.org.uk
