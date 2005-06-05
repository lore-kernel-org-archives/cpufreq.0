From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 2.6.12-rc5] policy->lock in cpufreq_add_dev
Date: Sun, 5 Jun 2005 19:11:00 +0200
Message-ID: <20050605171100.GD12338@dominikbrodowski.de>
References: <429DE8E8.5030904@stud.feec.vutbr.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <429DE8E8.5030904@stud.feec.vutbr.cz>
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
To: Michal Schmidt <xschmi00@stud.feec.vutbr.cz>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

On Wed, Jun 01, 2005 at 06:57:12PM +0200, Michal Schmidt wrote:
> Hello,
> I think that it's not necessary to take the policy->lock in cpufreq_add_dev.
> Am I missing something? What is the lock supposed to protect from?

Well, indeed it is not necessary to take the policy->lock, although it
doesn't do any harm AFAICS. I added it to make sure that _all_ accesses to
the data is protected by the lock, how serialized they may ever be..

Thanks,
	Dominik

PS: Always add Signed-off-by lines to your patches, please, as per
Documentation/SubmittingPatches
