From: Carl Thompson <cet@carlthompson.net>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates toACPIP-state
	driver
Date: Tue, 21 Oct 2003 17:10:10 -0700
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1066781410.8fc9a83422a85@carlthompson.net>
References: <7F740D512C7C1046AB53446D3720017304B038@scsmsx402.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <7F740D512C7C1046AB53446D3720017304B038@scsmsx402.sc.intel.com>
Content-Disposition: inline
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
To: "Nakajima, Jun" <jun.nakajima@intel.com>
Cc: cpufreq@www.linux.org.uk, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, arjanv@redhat.com, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>

Quoting "Nakajima, Jun" <jun.nakajima@intel.com>:

> ...

> Then you can put the CPU in C-state or lower P-state after (or even
> during) your word processor displays the letter. Even you can type very
> fast, the CPU is almost idle. Having frequent feedbacks simply provide
> more chances to save power consumption. Then aggregate saving would make
> a difference. In addition, penalty of making a wrong decision is cheap.

No, it is _more_ expensive.  With a longer poll interval, the CPU would
never be changed from the slowest speed because the percent idle over that
period would be too high.  More chances to switch speeds out of slowest is
more expensive, not less.

> ...

Carl Thompson
