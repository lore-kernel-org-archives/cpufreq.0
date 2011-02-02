From: Andreas Herrmann <herrmann.der.user@googlemail.com>
Subject: Re: [PATCH 3/4] libcpupower: libcpufreq: Provide boost information
 also for AMD family 12h and 15h
Date: Wed, 2 Feb 2011 20:07:27 +0100
Message-ID: <20110202190727.GA30936@alberich.amd.com>
References: <cover.1296572755.git.trenn@suse.de>
 <c415675017a84c013931e1ee0797468c1107ed33.1296572755.git.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=xCmKOCIUFTLRF4D4/KFB9I1AH5wts8fMRFWYzaIrqlk=;
        b=Uph10mopglUUhQXGfozFxSlkn1S5/gsWlqhOKYJ+9jA1xO4gFL4NJQtb/FnBjv+aO3
         YWNmVQvJYsMPdUOoKlQl14MUKkwvOANyuBnE6nQ5Sb1syaGaWvKQfOWb27PgQkPdaUlZ
         ltKH7SqqHvmXZrmhc97ijhBYVB+UsSGulNfn4=
Content-Disposition: inline
In-Reply-To: <c415675017a84c013931e1ee0797468c1107ed33.1296572755.git.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: linux@dominikbrodowski.net, cpufreq@vger.kernel.org

Thomas,

Arrgh ...

Accidentally I had forwarded you some old bogus patch.
Thus the device ID for family 15h is incorrect.

The patch better should look like below patch.
(It doesn't apply on your current tree, I guess, due to different
directory names)


Sorry for the hassle,

Andreas

From: Andreas Herrmann <andreas.herrmann3@amd.com>
libcpupower: libcpufreq: Provide CPB information for AMD CPU family 12h and 15h

Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
---
 lib/amdpci.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/amdpci.c b/lib/amdpci.c
index 1463db3..41e4908 100644
--- a/lib/amdpci.c
+++ b/lib/amdpci.c
@@ -48,7 +48,7 @@ static void amd_pci_nb_fini(void)
 int amd_pci_get_num_boost_states(int *active, int *states)
 {
 	uint8_t val;
-	int dev_ids[2] = {0x1204, 0};
+	int dev_ids[2] = {0x1204, 0x1604, 0x1704, 0};
 	struct pci_dev *device;
 
 	device = amd_pci_nb_init(dev_ids);
@@ -60,7 +60,7 @@ int amd_pci_get_num_boost_states(int *active, int *states)
 			*active = 1;
 		else
 			*active = 0;
-		*states = (val >> 2) & 1;
+		*states = (val >> 2) & 7;
 	}
 	amd_pci_nb_fini();
 
-- 
1.7.4.rc3

