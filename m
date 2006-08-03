From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Why supports the speedstep-ich only 2 processor states
Date: Thu, 3 Aug 2006 18:17:06 +0200
Message-ID: <20060803161706.GM17014@poupinou.org>
References: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
	<a11ccc30608030747v16bf4f2bs3ca2ff1b09bd5d36@mail.gmail.com>
	<a11ccc30608030802j57c2dc19h9298d001e81faaa1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <a11ccc30608030802j57c2dc19h9298d001e81faaa1@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hiroshi Miura <miura@da-cha.org>
Cc: cpufreq@lists.linux.org.uk

On Fri, Aug 04, 2006 at 12:02:21AM +0900, Hiroshi Miura wrote:
> Oh, I'm sorry I mistook the expression.
> 
> In early generaion of speedstep technology, a circuit which
> changes cpu frequency and voltage is connected to south bridge
> GPIO port or specific port.
> 
> It may be controlled by single flag(1/0), so it can serve
> only two frequency value.
> 
> Recent ich driver use a specific register port to control
> the circuit.(outb(value, (pmbase + 0x50));)

In the latter, only bit 0 will flip the 2 states btw.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
