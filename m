From: Yaroslav Rastrigin <yarick@relex.ru>
Subject: Re: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 18:20:06 +0400
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200308131820.07282.yarick@relex.ru>
References: <20030813135836.GA28615@via.ecp.fr> <20030813140443.GE1372@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030813140443.GE1372@poupinou.org>
Content-Disposition: inline
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Hi !
On Wednesday 13 August 2003 18:04, Ducrot Bruno wrote:
>
> could you post the output of
> lspci -vx -s0:
> please?
>
> Cheers,
Was speedstep_bx integrated to test3 ?  AFAIK T2x series of laptops are built 
using BX chipset, and speedstep-ich can't deal with it. I've just checked 
-test2 sources, and there isn't BX-aware code there. 
BTW, I've manually integrated speedstep_bx into speedstep-ich.c for 2.4.21-rc1 
vanilla (I can't run -ac for various reasons - some other patches are 
confilcting with -ac patchset).  There are some problems with cpufreq in 
general in plain 2.4.21-rc1 (f.e /proc/sys/cpu interface is broken - speed = 
speed_min = speed_max = 0), but /proc/cpufreq works well, and I could 
successfully change policies using /proc/cpufreq. Is anyone interested in 
diff ?
-- 
With all the best, yarick at relex dot ru.
