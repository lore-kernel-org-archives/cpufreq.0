From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Remove notify in speedstep_set_state [1/2]
Date: Fri, 11 Jun 2004 13:18:22 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040611121821.GD8779@redhat.com>
References: <20040611100223.GD1095@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040611100223.GD1095@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Fri, Jun 11, 2004 at 12:02:23PM +0200, Bruno Ducrot wrote:
 > Remove 'notify' in speedstep_set_state for speedstep-lib
 > 
 > Signed-off-by:  Bruno Ducrot <ducrot@poupinou.org>

How about [3/2] Fix speedstep-ich 8-)

  CC      arch/i386/kernel/cpu/cpufreq/speedstep-ich.o
  arch/i386/kernel/cpu/cpufreq/speedstep-ich.c: In function `speedstep_cpu_init':
  arch/i386/kernel/cpu/cpufreq/speedstep-ich.c:291: warning: passing arg 4 of `speedstep_get_freqs' from incompatible pointer type

The p4-clockmod change also broke the compile here, but I'm fixing
that up (just looks like a missing #include)

		Dave
