From: Dave Jones <davej@redhat.com>
Subject: Re: Shell script to select the right cpufreq module?
Date: Fri, 2 Apr 2004 23:36:59 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402223659.GH5688@redhat.com>
References: <4069CA25.2080806@free.fr>
	<20040330203109.GA7141@dominikbrodowski.de>
	<20040331073455.q797owk8kwogcccw@carlthompson.net>
	<20040331154400.GA32308@dominikbrodowski.de>
	<20040331155938.GF25834@redhat.com>
	<20040331205256.y2gjkw0404swwk84@carlthompson.net>
	<20040401124810.GA32536@redhat.com>
	<20040402141522.xpytwck0scwks0w4@carlthompson.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040402141522.xpytwck0scwks0w4@carlthompson.net>
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

On Fri, Apr 02, 2004 at 02:15:22PM -0800, Carl Thompson wrote:
 > Sorry!  Well, then, if it's compiled in how do I activate it so that it
 > actually works?  No cpufreq functionality seems to be active on
 > startup...

hmm puzzling. no cpufreq messages at all during boot ?

What does /proc/cpuinfo say, and is there anything in /sys/devices/system/cpu/cpu0/cpufreq ?
(if so, what are the contents of those files)

		Dave
