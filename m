From: Clement Bourdarias <phneutre@icculus.org>
Subject: Re: [PATCHES 2.5] cpufreq: fix up locking
Date: Sun, 13 Jul 2003 00:13:23 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030713001323.28985a97.phneutre@icculus.org>
References: <20030712215805.GA995@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030712215805.GA995@brodo.de>
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
To: cpufreq@www.linux.org.uk

Hello,

Will this fix the hard lockups we experienced with Athlons when jumping
from a low freq to the highest freq ?
(or is it completely unrelated ?)

Thanks,
Clement.

On Sat, 12 Jul 2003 23:58:05 +0200
Dominik Brodowski <linux@brodo.de> wrote:

> Hi all,
> 
> cpufreq locking was broken. Horribly. And I'm ashamed of it. Really. But
> these eleven patches[*] try to fix it. Please review, test & apply.
> 
> 	Dominik
> 
> [*] they don't really depend on the 
> - cpufreq-2.5.75-bk1-documentation_changes
> - cpufreq-2.5.75-bk1-fix_compilation_speedstep_debug
> patches but on the 
> - cpufreq-2.5.75-bk1-longrun_validate_can_fail
> patch which I all sent to this list before.
