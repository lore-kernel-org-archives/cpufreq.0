From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Acer Aspire  1350 broken PST
Date: Mon, 19 Apr 2004 11:26:24 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040419092624.GA13861@poupinou.org>
References: <20040416120519.GT8953@poupinou.org> <c5osds$fed$1@sea.gmane.org>
	<20040416151135.GV8953@poupinou.org> <c5otiu$ime$1@sea.gmane.org>
	<20040416152432.GW8953@poupinou.org> <c5p3e0$6js$1@sea.gmane.org>
	<20040416182013.GZ8953@poupinou.org>
	<20040417093220.GA7975@dominikbrodowski.de>
	<20040417130021.GB8953@poupinou.org>
	<20040417165838.GA7553@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040417165838.GA7553@dominikbrodowski.de>
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
To: jy <jy454@yahoo.fr>, cpufreq@www.linux.org.uk

On Sat, Apr 17, 2004 at 06:58:38PM +0200, Dominik Brodowski wrote:
> 
> [*] though I do not know whether the timing core would be able to handle it
> generally...

The problem is that AMD64 (and opterons)  processors do have expected
behaviour, that is if you change the frequency, TSC clock will change
as well, and there are SMP capable processors that are planed IIRC.
Also, I think TSC timer will not work properly if powernow-k8 on such
system (each processors would have different TSC frequencies),
unless heavy changes to the TSC timer code.  I'm not sure if making
it work does really matter, there is other good timers (like ACPI-timer)
after all.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
