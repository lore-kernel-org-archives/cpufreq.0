From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: My latest powernow-k8.c
Date: Fri, 19 Mar 2004 16:52:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040319155220.GI28592@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C1163C59A@txexmtae.amd.com>
	<20040319112429.GB5726@elf.ucw.cz>
	<20040319124122.GG28592@poupinou.org>
	<20040319133517.GA28122@dominikbrodowski.de>
	<20040319135605.GD248@elf.ucw.cz>
	<20040319143306.GA7246@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040319143306.GA7246@dominikbrodowski.de>
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
To: Pavel Machek <pavel@ucw.cz>, paul.devriendt@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>

On Fri, Mar 19, 2004 at 03:33:06PM +0100, Dominik Brodowski wrote:
> 
> 1.8 GHz * 0.88 = 1584000 kHz -- min and max are set to this value at first.
> As there is no state the CPU can be set to in between min and max, the max
> value is increased to the next higher state [see
> cpufreq_frequency_table_verify()] So there's nothing strange here, IMHO.

Agreed, but I expected that the % will change in fact.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
