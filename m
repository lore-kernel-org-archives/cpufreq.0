From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [ACPI] _PDC method in DSDT
Date: Mon, 23 Jun 2003 15:42:43 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030623134243.GB2330@brodo.de>
References: <F760B14C9561B941B89469F59BA3A84725A301@orsmsx401.jf.intel.com> <1056354807.10323.71.camel@aldebaran.caltech.edu>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1056354807.10323.71.camel@aldebaran.caltech.edu>
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
Content-Transfer-Encoding: 7bit
To: David Moore <dcm@acm.org>
Cc: "Grover, Andrew" <andrew.grover@intel.com>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq@www.linux.org.uk

On Mon, Jun 23, 2003 at 12:53:27AM -0700, David Moore wrote:
> My intention was not for processor.c and cpufreq to cooperate, but
> rather for processor.c to be able to control Enhanced Speedstep solely
> with P-states -- no cpufreq necessary.  Cpufreq is certainly useful for
> those systems not running the ACPI driver, but in the long run, ACPI and
> processor.c seem to be the right way to get maximum compatibility with
> many platforms.

Actually, in 2.5. ACPI provides one of several cpufreq drivers. The user can
choose which one best suits his needs [e.g. speedstep-centrino for the
faster wrmsr method instead of the slow io-based ACPI-2.0 module - 
arch/i386/cpu/cpufreq]. Also I doubt that ACPI will allow maximum
compatibility: this new _PCT method again tries to implement things
in a "proprietary", "legacy", "secret" way, supported only by
reverse-engineered or binary-only drivers.

	Dominik
