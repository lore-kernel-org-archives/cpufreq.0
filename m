From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 16:04:43 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030813140443.GE1372@poupinou.org>
References: <20030813135836.GA28615@via.ecp.fr>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030813135836.GA28615@via.ecp.fr>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Bilien <jobi@via.ecp.fr>
Cc: cpufreq@www.linux.org.uk

On Wed, Aug 13, 2003 at 03:58:36PM +0200, Johan Bilien wrote:
> Hi,
> 
> I'm trying to run cpufreq on my IBM laptop Thinkpad T22, with a Pentium
> 3 900 (with speedstep). I have a linux 2.6.0-test3 kernel, and have
> speedstep-ich.ko and speedstep-lib.ko compiled as modules. When I insmod
> speedstep-lib, nothing happens. When I insmod speedstep-ich, I get:
> 
> FATAL: Error inserting speedstep_ich
> (/lib/modules/2.6.0-test3/kernel/arch/i386/kernel/cpu/cpufreq/\
> speedstep-ich.ko): No such device

could you post the output of
lspci -vx -s0:
please?

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
