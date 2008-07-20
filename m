From: Laurence Darby <ldarby@tuffmail.com>
Subject: Re: Core 2 Duo E8400 stepping 6 not recognised
Date: Sun, 20 Jul 2008 01:12:51 +0100
Message-ID: <20080720011251.51aa29f4.ldarby@tuffmail.com>
References: <20080717001145.122c97b7.ldarby@tuffmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080717001145.122c97b7.ldarby@tuffmail.com>
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
To: cpufreq@lists.linux.org.uk

Laurence Darby wrote:

> 
> The motherboard is gigabyte GA-G33-DS3R, chipset is Intel G33 ICH9 
> 
> What can I do to get this working?
> 

It turns out the answer was to upgrade the bios, the MB came with
version F5, the latest is F7h:
http://www.gigabyte.com.tw/Support/Motherboard/BIOS_Model.aspx?ProductID=2535
which says it's an update for Wolfdale cores...

It's possible to do it from linux userland, which was a pleasant
suprise to me, using flashrom from coreboot
( http://www.coreboot.org/Flashrom#Installation ),  see also:
http://www.coreboot.org/pipermail/coreboot/2008-July/036747.html

Cheers,
Laurence
