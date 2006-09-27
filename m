From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Disable arbiter CLE266
Date: Wed, 27 Sep 2006 01:06:39 -0400
Message-ID: <20060927050639.GC3571@redhat.com>
References: <45198341.4080202@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <45198341.4080202@interia.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Tue, Sep 26, 2006 at 09:45:05PM +0200, Rafał Bilski wrote:
 > Please ignore previous two messages. :-)
 > 
 > This patch is adding support for CPU connected to CLE266 
 > chipset. For older CPU this is only way. For "Powersaver" 
 > processor this way will be used if ACPI C3 isn't supported.
 > 
 > Signed-off-by: Rafał Bilski <rafalbilski@interia.pl>
 
Argh, I already applied the second of the earlier diffs.
Can you send an incremental diff to whats in cpufreq.git?

Thanks,

	Dave 
