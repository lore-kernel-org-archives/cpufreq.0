From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Athlon 64 complains of frequency mismatch
Date: Tue, 22 Jun 2004 19:11:03 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040622171103.GB8111@dominikbrodowski.de>
References: <20040618185103.GA14909@buici.com>
	<20040619104456.GA7689@dominikbrodowski.de>
	<20040619155554.GA32432@buici.com>
	<20040618185103.GA14909@buici.com>
	<20040619104456.GA7689@dominikbrodowski.de>
	<20040619163631.GA1369@buici.com>
	<20040621202601.GA8064@dominikbrodowski.de>
	<20040621214236.GA3858@buici.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040621214236.GA3858@buici.com>
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
To: Marc Singer <elf@buici.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Jun 21, 2004 at 02:42:36PM -0700, Marc Singer wrote:
> I did fetch it.  There are no entries for _PSS or even PSS.

But an entry XPSS which contains these bogus entries...


            Name (XPSS, Package (0x03)
            {
                Package (0x06)
                {
                    0x09999999,
                    0x00099999,
                    0x00999999,
                    0x00999999,
                    0x99999999,
                    0x99999999
                },

                Package (0x06)
                {
                    0x09999999,
                    0x00099999,
                    0x00999999,
                    0x00999999,
                    0x99999999,
                    0x99999999
                },

                Package (0x06)
                {
                    0x09999999,
                    0x00099999,
                    0x00999999,
                    0x00999999,
                    0x99999999,
                    0x99999999
                }
            })


I'm surprised a) that the BIOS-provided tables contain such obviously bogus
data, and b) that XPSS is used by the ACPI subsystem instead of reporting
there is no _PSS.

Also, are there any entries in the BIOS you can toggle which might be
related to "Cool&Quiet", "PnP-capable OS", ...?

	Dominik
