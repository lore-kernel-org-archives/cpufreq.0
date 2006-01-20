From: Dave Jones <davej@redhat.com>
Subject: Re: [2.6 patch] X86_GX_SUSPMOD must depend on PCI
Date: Thu, 19 Jan 2006 19:45:38 -0500
Message-ID: <20060120004538.GD3798@redhat.com>
References: <20060120002537.GI19398@stusta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060120002537.GI19398@stusta.de>
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
To: Adrian Bunk <bunk@stusta.de>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Fri, Jan 20, 2006 at 01:25:37AM +0100, Adrian Bunk wrote:
 > This patch fixes the following compile error:
 > 
 > ...
 >   CC      arch/i386/kernel/cpu/cpufreq/gx-suspmod.o
 > arch/i386/kernel/cpu/cpufreq/gx-suspmod.c: In function 'gx_detect_chipset':
 > arch/i386/kernel/cpu/cpufreq/gx-suspmod.c:193: error: implicit declaration of function 'pci_match_id'
 > arch/i386/kernel/cpu/cpufreq/gx-suspmod.c:193: warning: comparison between pointer and integer
 > make[3]: *** [arch/i386/kernel/cpu/cpufreq/gx-suspmod.o] Error 1
 > 
 > <--  snip  -->
 > 
 > 
 > Signed-off-by: Adrian Bunk <bunk@stusta.de>

Applied, thanks Adrian.

		Dave
