From: st3@riseup.net
Subject: Re: speedstep-centrino on dothan
Date: Fri, 8 Jul 2005 10:58:40 +0200
Message-ID: <20050708105840.784f6d53@horst.morte.male>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com>
	<20050707235928.71016f61@horst.morte.male>
	<20050708051050.GA3201@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050708051050.GA3201@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk, Bill Davidsen <davidsen@tmr.com>, linux-kernel@vger.kernel.org

On Fri, 8 Jul 2005 07:10:50 +0200
Dominik Brodowski <linux@dominikbrodowski.net> wrote:

> On Thu, Jul 07, 2005 at 11:59:28PM +0200, st3@riseup.net wrote:
> > read from ACPI tables, while still keeping them available.
> 
> You're only keeping some of them available, as you overwrite one such
> setting. Alternatively you can increase p.state_count by one early enough.

Yes, but I was just overwriting the latest ones, that are never used =).
Anyway, your solution is theoretically better.


--
ciao
st3
