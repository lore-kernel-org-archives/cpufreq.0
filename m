From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] fix powernow-k8 compilation [bug 3180]
Date: Wed, 11 Aug 2004 11:27:42 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040811102742.GB17673@redhat.com>
References: <20040811102051.GA3536@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040811102051.GA3536@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Wed, Aug 11, 2004 at 12:20:51PM +0200, Dominik Brodowski wrote:
 > Propagate the new CONFIG_X86_POWERNOW_K8_ACPI to powernow-k8.h to avoid
 > compile breakage. Fixes bug 3180.
 > 
 > Signed-off-by: Dominik Brodowski <linux@brodo.de>

Argh, hopefully this is the last of these CONFIG*ACPI changes.
I'm tired of getting deja-vu every time I see one 8-)

Thanks,

		Dave
