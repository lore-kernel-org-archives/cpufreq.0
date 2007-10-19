From: Dave Jones <davej@redhat.com>
Subject: Re: acpi-cpufreq dissapires when FSB is changed
Date: Fri, 19 Oct 2007 14:45:49 -0400
Message-ID: <20071019184549.GI26460@redhat.com>
References: <47177FAF.2070206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <47177FAF.2070206@gmail.com>
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
To: Nebojsa Trpkovic <trx.lists@gmail.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Oct 18, 2007 at 05:45:51PM +0200, Nebojsa Trpkovic wrote:

 > is there any way to make acpi-cpufreq use multiplier-voltage instead of
 > frequency-voltage pairs?

No. It's using tables that come from the BIOS.
When you overclock, those tables are no longer correct,
so it can't work.

	Dave

-- 
http://www.codemonkey.org.uk
