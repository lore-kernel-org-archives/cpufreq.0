From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] fix panic in powernow_k8_verify on MP but PSB systems
Date: Wed, 26 May 2004 22:29:26 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040526212926.GG22630@redhat.com>
References: <20040526203347.GA9388@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040526203347.GA9388@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, paul.devriendt@amd.com

On Wed, May 26, 2004 at 10:33:47PM +0200, Dominik Brodowski wrote:
 > Instead of -ENODEV; powernow_k8_cpu_init returns 0 if it's running on a MP
 > system but PSB BIOS is tried... this causes a panic in
 > powernow_k8_verify, as can be seen at
 > http://forums.gentoo.org/viewtopic.php?t=177423

Seems to make sense.
Applied.

 > Signed-off-by: Dominik Brodowski <linux@brodo.de>

Thanks for this too. I'll start propagating these through the
cpufreq changes.

		Dave
