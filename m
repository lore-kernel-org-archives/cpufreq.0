From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: speedstep-centrino on dothan
Date: Fri, 8 Jul 2005 07:10:50 +0200
Message-ID: <20050708051050.GA3201@isilmar.linta.de>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com>
	<20050707235928.71016f61@horst.morte.male>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050707235928.71016f61@horst.morte.male>
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
Content-Transfer-Encoding: 7bit
To: st3@riseup.net
Cc: cpufreq@lists.linux.org.uk, Bill Davidsen <davidsen@tmr.com>, linux-kernel@vger.kernel.org

On Thu, Jul 07, 2005 at 11:59:28PM +0200, st3@riseup.net wrote:
> read from ACPI tables, while still keeping them available.

You're only keeping some of them available, as you overwrite one such
setting. Alternatively you can increase p.state_count by one early enough.

> index = (((frequency)/100) << 8) | ((voltage - 700) / 16);
> printf ("%u\n", index);
	printf ("0x%x\n", index);
is better

> want 500MHz at 940mV, you could add:
> 
> centrino_model[cpu]->op_points[p.state_count - 2].index = 0x1295;
> centrino_model[cpu]->op_points[p.state_count - 2].index = 500000;
						.frequency
> p.states[p.state_count - 2].core_frequency = 500;


	Dominik
