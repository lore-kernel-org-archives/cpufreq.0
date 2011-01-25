From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHSET] workqueue: update workqueue users - replace
 create_workqueue()
Date: Tue, 25 Jan 2011 15:29:21 +0100
Message-ID: <20110125142921.GB27510@htj.dyndns.org>
References: <1294062595-30097-1-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=/XU/9Cg5qPnmIXBnisD2NOuYAIERDALQMz8xzja5mmg=;
        b=VgEbVa5A13FsTteabyerrS2C5HzFQIh3+k17jMymjpAJRexEJNa/TJD6KFyL/P3Hdb
         jrrpv6sYp4o40F7ckZ0COl/XqSvSDAUQ5E//KIynN/BzApno09PZfIx1lcHkHnqVfnwp
         9ByszniDKTNJH0QGDISBYoZ6UD2iX97cHIThE=
Content-Disposition: inline
In-Reply-To: <1294062595-30097-1-git-send-email-tj@kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: lenb@kernel.org, linux-acpi@vger.kernel.org, davej@redhat.com, cpufreq@vger.kernel.org, Markus.Lidel@shadowconnect.com, tomas.winkler@intel.com, jayamohank@serverengines.com, andrew.vasquez@qlogic.com, James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, tomof@acm.org, stf_xl@wp.pl, linux-usb@vger.kernel.org, tytso@mit.edu, mfasheh@suse.com, joel.becker@oracle.com, reiserfs-devel@vger.kernel.org, aelder@sgi.com, hch@infradead.org, ericvh@gmail.com, rminnich@sandia.gov, v9fs-developer@lists.sourceforge.net, lucho@ionkov.net, andy.grover@oracle.com

Hello,

There was no response for the following patches and I'm planning on
routing them through workqueue#for-2.6.39.  If you have an objection
or want to take the patch through a different tree, please let me
know.

 0006-acpi-kacpi-_wq-don-t-need-WQ_MEM_RECLAIM.patch
 0007-cpufreq-use-system_wq-instead-of-dedicated-workqueue.patch
 0012-i2o-use-alloc_workqueue-instead-of-create_workqueue.patch
 0013-misc-iwmc3200top-use-system_wq-instead-of-dedicated-.patch
 0016-scsi-be2iscsi-qla2xxx-convert-to-alloc_workqueue.patch
 0018-scsi-scsi_tgt_lib-scsi_tgtd-isn-t-used-in-memory-rec.patch
 0019-usb-ueagle-atm-use-system_wq-instead-of-dedicated-wo.patch
 0025-ext4-convert-to-alloc_workqueue.patch
 0026-ocfs2-use-system_wq-instead-of-ocfs2_quota_wq.patch
 0027-reiserfs-make-commit_wq-use-the-default-concurrency-.patch
 0028-xfs-convert-to-alloc_workqueue.patch
 0029-net-9p-use-system_wq-instead-of-p9_mux_wq.patch
 0030-net-9p-replace-p9_poll_task-with-a-work.patch
 0031-rds-ib-use-system_wq-instead-of-rds_ib_fmr_wq.patch

The whole series can be found at the following URL.

 http://thread.gmane.org/gmane.linux.kernel/1082587

Thank you.

-- 
tejun
