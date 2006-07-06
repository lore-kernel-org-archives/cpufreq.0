From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Use hardware support
Date: Thu, 6 Jul 2006 15:48:40 -0400
Message-ID: <20060706194840.GO13168@redhat.com>
References: <44A8A8C9.3070901@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44A8A8C9.3070901@interia.pl>
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

On Mon, Jul 03, 2006 at 07:19:05AM +0200, Rafał Bilski wrote:
 > This patch depends on "Longhaul - There are limits".
 > Minimal change necessary for hardware support.
 > 
 > Changes in longhaul.c:
 > - most important - now C3 state is causing transition,
 > - code resopnsible for clearing "bus master" bit removed,
 > - protect bcr2 transition in the same way as longhaul.
 > 
 > Signed-off-by: Rafał Bilski <rafalbilski@interia.pl>

applied, thanks.

		Dave

-- 
http://www.codemonkey.org.uk
