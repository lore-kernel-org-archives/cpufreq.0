From: Dave Jones <davej@redhat.com>
Subject: Re: banias with different (unusual?) model_name
Date: Mon, 23 Aug 2004 12:13:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040823111315.GA1589@redhat.com>
References: <20040820093344.GA2923@akamail.com>
	<1093008335.30968.32.camel@localhost.localdomain>
	<20040821115316.GA2582@akamail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040821115316.GA2582@akamail.com>
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
To: matthias brill <matthias.brill@akamail.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel <linux-kernel@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, cpufreq list <cpufreq@www.linux.org.uk>

On Sat, Aug 21, 2004 at 01:53:16PM +0200, matthias brill wrote:

 > if i understand correctly, the type of the cpu can be determined by
 > looking at the family, model and stepping -- assuming that these values
 > are reported directly  by the CPUID (0FA2) instruction. 

download the source for x86info sometime, and look at the hoops
it jumps through to determine what cpu its running on. It isn't
just as simple as a few cpuid calls any more. These days there are
typically up to a half dozen factors that you need to look at to
discriminate between possibilities. One of these, is cpu speed.
Unfortunatly, as we could have booted off mains, and hence a lower
clock speed, we can't do any runtime calculation like we do with
bogomips/jiffies, so we have to resort to looking at the model name
supplied by the BIOS.

 > the BIOS supplied model_name string in speedstep-centrino.c is parsed to
 > get the clock cycle time of the cpu.  is this actually supposed to be
 > the "right" way (or worse: the only way) to get this information?

It's pretty much all we have that we can trust.  If we could
do something else, I'd love to, as I distrust the abilities of
BIOS programmers as much as anyone else.

		Dave
