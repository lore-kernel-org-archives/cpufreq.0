From: "Marco Cusmai" <cusmai@gmail.com>
Subject: Re: speedstep-ich issue
Date: Mon, 2 Oct 2006 10:14:37 +0200
Message-ID: <66f5c650610020114v22cc56f9i5dbee03349ade1d0@mail.gmail.com>
References: <200609291111.48598.cusmai@gmail.com>
	<20060929174035.GE13444@inferi.kami.home>
	<200609292149.42603.cusmai@gmail.com>
	<20061002021330.GD19253@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20061002021330.GD19253@isilmar.linta.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco cusmai <cusmai@gmail.com>, cpufreq@lists.linux.org.uk

On 10/2/06, Dominik Brodowski <linux at dominikbrodowski.net> wrote:
>
> Hi,
>
> On Fri, Sep 29, 2006 at 09:49:42PM +0000, Marco cusmai wrote:
> > cat scaling_available_frequencies : 1130500 731500
> > cat scaling_min_freq : 731500
> > cat scaling_max_freq : 731500
>
> Yes, then it won't scale any more -- the CPU will only be set to a value
> between scaling_min_freq and scaling_max_freq. Therefore, please check the
> configuration file for cpufreqd (or any other cpufreq daemon you're
> running).
>
> Thanks,
>         Dominik
>
For my tests I've already disabled the cpufreqd deamon at startup.. The
results are the same.
I've also tried the following:

echo 1130500 > scaling_setspeed
cat scaling_cur_freq : 731500

The governor I actualy use is "userspace". Even with "performance" the freq
stays low
